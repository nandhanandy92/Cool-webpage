# Cool-webpage
Terraform AWS S3 Static Website Deployment

This Terraform script deploys a static website on Amazon S3. The website consists of two pages, `index.html` and `error.html`, with additional styling and vector shapes.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS credentials configured.

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/s3-static-website.git

Navigate to the project directory:cd s3-static-websiteUpdate the main.tf 
file:Replace "your-unique-bucket-name" with a globally unique bucket name.


Update the HTML files:Modify index.html and error.html in the path/to/your/ directory to customize the content.

Initialize and apply the 
Terraform configuration:

terraform init

terraform apply Confirm with yes when prompted.
Once the deployment is complete, the website will be hosted on the S3 bucket. Access it via the endpoint provided in the Terraform output.

Cleanup: To destroy the infrastructure and remove the S3 bucket, run:
terraform destroy Confirm with yes when prompted.


Website Styling and Background index.html: A welcoming page with a blue wave-like background.error.html: An error page with a red wave-like background.The styling and background are defined in the respective HTML files.Feel free to customize the HTML content and styles to suit your preferences.Remember to replace `"your-unique-bucket-name"` with an actual unique bucket name.

This README provides clear instructions on how to use and customize the Terraform code for deploying the S3 static website.
