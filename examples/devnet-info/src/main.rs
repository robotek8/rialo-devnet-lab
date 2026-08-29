use rialo_cdk::{ClientContext, RpcClient as _};

#[tokio::main]
async fn main() -> rialo_cdk::Result<()> {
    println!("Connecting to Rialo DevNet...");

    let client = ClientContext::new(
        rialo_cdk::constants::URL_DEVNET.to_string()
    );

    let block_height = client.get_block_height().await?;

    println!("Connected successfully.");
    println!("Rialo DevNet block height: {block_height}");

    Ok(())
}
