use rialo_cdk::{
    constants::URL_DEVNET,
    keyring::{InMemoryKeyringProvider, KeyringProvider},
    rpc::types::Pubkey,
    sdk::{Rialo, RialoConfig},
};
use std::{env, str::FromStr};

#[tokio::main]
async fn main() -> rialo_cdk::Result<()> {
    let recipient_arg = env::args()
        .nth(1)
        .expect("Usage: cargo run -- <RIALO_RECIPIENT_ADDRESS>");

    let recipient = Pubkey::from_str(&recipient_arg)?;

    println!("Creating temporary Rialo DevNet wallet...");

    let provider = InMemoryKeyringProvider::new();
    let keyring = provider
        .create("devnet-transfer", "devnet-only")
        .await?;

    let config = RialoConfig::new(URL_DEVNET.to_string(), keyring);
    let sdk = Rialo::new(config);

    println!("Requesting 0.01 RLO from DevNet faucet...");
    let faucet_sig = sdk.airdrop(0.01, None).await?;
    println!("Faucet transaction: {faucet_sig}");

    let balance_before = sdk.get_account_balance(None).await?;
    println!("Temporary wallet balance: {balance_before} RLO");

    println!("Sending 0.001 RLO to {recipient}...");

    let transfer_sig = sdk.transfer(recipient, 0.001).await?;

    println!("Transfer confirmed!");
    println!("Transaction: {transfer_sig}");

    let balance_after = sdk.get_account_balance(None).await?;
    println!("Remaining temporary balance: {balance_after} RLO");

    Ok(())
}
