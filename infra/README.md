# Deploy GKE cluster with Terraform

For this demo, we are using a 3-node GKE cluster. Feel free to modify the TF files. However, the default parameters are enough to run the whole demo.

## Prerequisites
* GCP project with admin access [remember to change the default project]
* gcloud SDK
* GKE API enabled in GCP
* Terraform

## Deployment

The default location is europe-west-c, but feel free to choose your own location. If you do so, you will need to modify the main.yf and provider.tf files accordingly. Assuming you already have a GCP project where you have admin access, first you need to allow Terraform to deploy services in the project (if you want to configure your own project, you'll need to modify the provider.tf file to reflect the right project ID). You can do this simply with this command:

`gcloud auth application-default login`

After this, you can verify the deployment with:

`terraform plan`

and finally, apply the plan:

`terraform apply`


After a few minutes, you should have a GKE cluster up and running in your project.