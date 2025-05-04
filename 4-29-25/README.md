# Terraform & Load Balancer Setup

## Project Details
- **Project:** `true-artwork-456400-g8`
- **Bucket:** `terraformstate065`
- **Region:** `southamerica-east1` (Sao Paulo)
- **Credentials:** `"mykey.json"`
- **Key Location:** `C:\Users\Twismfamily\Documents\TheoWAF\class6.5\GCP\Terraform\tfk`

---

## Steps to Set Up a Load Balancer
1. **Log into the cloud** *(Authentication is required to access resources.)*
2. **Create a VPC** *(Virtual Private Cloud for network isolation.)*
3. **Create a Cloud Router** *(Handles dynamic routing within the VPC.)*
4. **Create an Instance Template** *(Defines VM configurations for autoscaling.)*
5. **Create a Load Balancer** *(Distributes traffic across multiple instances.)*
6. **Create a Firewall** *(Manages incoming/outgoing traffic rules.)*

---

## Terraform Notes
- Terraform filenames don’t matter, but **must** have a `.tf` extension.
- Terraform can be configured in **one file** or **multiple files**.
- **Terraform fmt** *(Formats Terraform configuration files.)*

```bash
  terraform fmt -check --diff
```

```bash
Terraform apply
```
>(Executes changes without manual approval.)

```bash
terraform apply --auto-approve
```

## Terraform Instructions

```bash
Terraform init
```
>(Initializes Terraform working directory.)

- 🔥🔥🔥 **DO NOT TOUCH THE LOCK FILE OR STATE FILE** 🔥🔥🔥
>(Critical for tracking infrastructure state.)

```bash
Terraform validate
```
>(Checks configuration correctness & saves state.)

```bash
Terraform plan
```
>(Shows planned changes before applying.)

```bash
Terraform apply
```
>(Deploys infrastructure.)

```bash
Terraform destroy
```
>(Removes all deployed resources.)