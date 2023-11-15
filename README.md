# Cool-webpage
Terraform AWS S3 Static Website Deployment

This Terraform script deploys a static website on Amazon S3. The website consists of two pages, `index.html` and `error.html`, with additional styling and vector shapes.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS credentials configured.

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/nandhanandy92/Cool-webpage.git

Navigate to the project directory:cd s3-static-websiteUpdate the main.tf 
file:Replace "your-unique-bucket-name" with a globally unique bucket name.

2. Initialize and apply the Terraform configuration:

   ```bash
   terraform init

   terraform #apply Confirm with yes when prompted.
   ```

3. Once the deployment is complete, the website will be hosted on the S3 bucket. Access it via the endpoint provided in the Terraform output.

4. Cleanup: To destroy the infrastructure and remove the S3 bucket, run:
terraform destroy Confirm with yes when prompted.


5. Website Styling and Background 
   - index.html: A welcoming page with a blue wave-like background.

   - error.html: An error page with a red wave-like background.The styling and background are defined in the respective HTML files.Feel free to customize the HTML content and styles to suit your preferences.

6. Remember to replace `"your-unique-bucket-name"` with an actual unique bucket name.
