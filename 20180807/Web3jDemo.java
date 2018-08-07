package com.hello1987.web3j;

import com.demo.test.TokenDemo;
import org.web3j.abi.FunctionEncoder;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.Address;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.RawTransaction;
import org.web3j.crypto.TransactionEncoder;
import org.web3j.protocol.admin.Admin;
import org.web3j.protocol.core.DefaultBlockParameterName;
import org.web3j.protocol.core.methods.response.EthGetTransactionCount;
import org.web3j.protocol.core.methods.response.EthSendTransaction;
import org.web3j.protocol.http.HttpService;
import org.web3j.tx.Contract;
import org.web3j.tx.ManagedTransaction;
import org.web3j.utils.Convert;
import org.web3j.utils.Numeric;

import java.io.IOException;
import java.math.BigInteger;
import java.util.Arrays;

public class Web3jDemo {

    //    static Admin admin = Admin.build(new HttpService("https://mainnet.infura.io/BVLUfCYxvS2Gp9MgQ3qv"));
    static Admin admin = Admin.build(new HttpService("http://222.73.134.245:8546"));

    public static void main(String[] args) throws Exception {
//        Credentials finalCredentials = Credentials.create("08a115c6d7da1ae15d0bda9bd528b2d4f99c82b822e31648b6e77fd666336074");
//        TokenDemo tokenDemo = TokenDemo.deploy(admin, finalCredentials,
//                ManagedTransaction.GAS_PRICE,
//                Contract.GAS_LIMIT, BigInteger.valueOf(10000000), "HNB GAS", BigInteger.valueOf(18), "HGS").send();
//        String contractAddress = tokenDemo.getContractAddress();
//        System.out.println(contractAddress);
        token();
//        eth();
    }

    private static void eth() throws IOException {
//        String walletAddress = "0xe241731cfbc2fbe3dc8668396fce0d1e87b8484c";
//        String toAddress = "0x3d51de546dc84ecd7f68774b94be94ff95fe2f98";
//        String privateKey = "08a115c6d7da1ae15d0bda9bd528b2d4f99c82b822e31648b6e77fd666336074";

        String walletAddress = "0x3d51de546dc84ecd7f68774b94be94ff95fe2f98";
        String toAddress = "0x46DC29B91b1558CC4f6C4799551bB961b6af346D";
        String privateKey = "25fdb6e01ae3e175e87e94b580d658d63ecf8118722b09c0dfaca6882e746750";

        EthGetTransactionCount ethGetTransactionCount = admin.ethGetTransactionCount(walletAddress, DefaultBlockParameterName.LATEST).send();
        BigInteger nonce = ethGetTransactionCount.getTransactionCount();

        BigInteger value = Convert.toWei("7", Convert.Unit.ETHER).toBigInteger();
        RawTransaction rawTransaction = RawTransaction.createEtherTransaction(nonce, ManagedTransaction.GAS_PRICE, BigInteger.valueOf(200000), toAddress, value);

        Credentials credentials = Credentials.create(privateKey);

        byte[] signedMessage = TransactionEncoder.signMessage(rawTransaction, credentials);
        String hexValue = Numeric.toHexString(signedMessage);
        EthSendTransaction ethSendTransaction = admin.ethSendRawTransaction(hexValue).send();
        String txid = ethSendTransaction.getTransactionHash();
        System.out.println(txid);
    }

    private static void token() throws IOException {
//        String walletAddress = "0xe241731cfbc2fbe3dc8668396fce0d1e87b8484c";
//        String contractAddress = "0x5df3b0179b4935fc0ea4f4b26d2e9618a33931b6";
//        String toAddress = "0x3d51de546dc84ecd7f68774b94be94ff95fe2f98";
//        String privateKey = "08a115c6d7da1ae15d0bda9bd528b2d4f99c82b822e31648b6e77fd666336074";

        String walletAddress = "0x3d51de546dc84ecd7f68774b94be94ff95fe2f98";
        String contractAddress = "0x5df3b0179b4935fc0ea4f4b26d2e9618a33931b6";
        String toAddress = "0xc76b268075a2ec7ab16837c41ced726b4cc649f7";
        String privateKey = "25fdb6e01ae3e175e87e94b580d658d63ecf8118722b09c0dfaca6882e746750";

        EthGetTransactionCount ethGetTransactionCount = admin.ethGetTransactionCount(walletAddress, DefaultBlockParameterName.LATEST).send();
        BigInteger nonce = ethGetTransactionCount.getTransactionCount();

        BigInteger big = Convert.toWei("100", Convert.Unit.ETHER).toBigInteger();
        Function function = new Function("transfer", Arrays.asList(new Address(toAddress), new Uint256(big)), Arrays.asList(new TypeReference<Address>() {
        }, new TypeReference<Uint256>() {
        }));
        String functionStr = FunctionEncoder.encode(function);
        System.out.println(functionStr);

        RawTransaction rawTransaction = RawTransaction.createTransaction(nonce, ManagedTransaction.GAS_PRICE, BigInteger.valueOf(200000), contractAddress, functionStr);

        Credentials credentials = Credentials.create(privateKey);

        byte[] signedMessage = TransactionEncoder.signMessage(rawTransaction, credentials);
        String hexValue = Numeric.toHexString(signedMessage);
        System.out.println(hexValue);

        EthSendTransaction ethSendTransaction = admin.ethSendRawTransaction(hexValue).send();
        String txid = ethSendTransaction.getTransactionHash();
        System.out.println(txid);
    }
}
