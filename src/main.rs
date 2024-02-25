use clap::Parser;
use anyhow::{Context, Result};
use reqwest;
use tokio;

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    #[arg(short, long)]
    auth_key: String,

    #[arg(short = 'n', long)]
    service_name: String,

    #[arg(short, long)]
    session_id: String,
}

#[tokio::main]
async fn main() -> Result<()> {
    let args = Args::parse();
    get_services(&args.auth_key).await?;
    println!("Hello {}!", args.auth_key);
    Ok(())
}

// call to the main server at app.velocifire.com to get the list of services
async fn get_services(auth_key: &str) -> Result<()> {
    let url = "https://app.velocifire.com/api/v1/services";
    let client = reqwest::Client::new();
    let response = client
        .get(url)
        .header("Authorization", format!("Bearer {}", auth_key))
        .send()
        .await
        .context("Failed to send request")?;
    let body = response.text().await.context("Failed to get response body")?;
    println!("{}", body);
    Ok(())
}
