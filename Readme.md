# Simple OZ Account Implementation + Deployment

Not a serious project, but while studying OZ's Cairo account implementation, I decided to re-write the library rather than just import and use. Then manually deploy my own account using Protostar.

Had issues with generating random public-private keypairs, so I created a react app that does that using starknet-js.

If you're looking to manually deploy your own account:
1. Clone the repo or import account library directly from OZ.
2. Generate public-private keypairs by running the react-app, and copying the random keys generated on-screen.
```
cd account-gen
npm run start
```
3. Pre-compute your account address from your public key using Protostar command:
```
protostar calculate-account-address --account-address-salt 123 --account-class-hash 0x058d97f7d76e78f44905cc30cb65b91ea49a4b908a76703c54197bca90f81773 --account-constructor-input [Random Public key from React App]
```
where `0x058d97f7d76e78f44905cc30cb65b91ea49a4b908a76703c54197bca90f81773` is OZ's account v5.0 declared hash.

4. Now transfer some funds [ETH] to the computed address, in order to deploy our account.

5. Set private key in terminal
```
export PROTOSTAR_ACCOUNT_PRIVATE_KEY=[Random Private key From React App]
```
6. Run protostar `deploy-account` command:
```
protostar deploy-account --account-address 0x04ea250448a6b283359c3149b669d5dedca269ec32507e59a6354e5ecfdc16ad --account-address-salt 123 --account-class-hash 0x058d97f7d76e78f44905cc30cb65b91ea49a4b908a76703c54197bca90f81773 --account-constructor-input [Random Public key from React App] --network testnet --max-fee 4000000000000 --nonce 1
```

Voila, you should have your StarkNet account deployed!

When next, I'm free, let's do something more fun like creating a multi-sig.