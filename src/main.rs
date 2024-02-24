use clap::Parser;

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
fn main() {
    let args = Args::parse();
    
    println!("Hello {}!", args.auth_key)
}
