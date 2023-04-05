# Terraform AWS EKS cluster

* Provisioning AWS EKS cluster with Terraform

## Example
Put this configuration into your inventory

```
module "eks" {
  source            = "git::https://github.com/mach1el/terraform-aws.git//eks"
  aws_region        = "us-east-2"
  cluster_role_name = "PhantomClusterRoles"
  cluster_name      = "Phantom Cluster"
  kube_version      = "1.24"
  subnet_ids        = ["subnet-123","subnet-456"]
}
```

You can also put variables into `terraform.tfvars`, it must same path with `main.tf` inventory

```
module "eks" {
  source            = "git::https://github.com/mach1el/terraform-aws.git//eks"
  aws_region        = var.aws_region
  cluster_role_name = var.cluster_role_name
  cluster_name      = var.cluster_name
  kube_version      = var.kube_version
  subnet_ids        = var.subnet_ids
}
```

`terraform.tfvars`

```
aws_region        = "us-east-2"
cluster_role_name = "PhantomClusterRoles"
cluster_name      = "Phantom Cluster"
kube_version      = "1.24"
subnet_ids        = ["subnet-123","subnet-456"]
```

## Input
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|<a name="aws_region"></a> [aws_region](#) | Select your region | `string` | `null` | yes |
|<a name="cluster_role_name"></a> [cluster_role_name](#) | Set cluster role name | `string` | `MyApp-cluster-roles` | yes |
|<a name="cluster_name"></a> [cluster_name](#) | Naming your cluster | `string` | `Phantom` | yes |
|<a name="kube_version"></a> [kube_version](#) | Pick kubernetes version | `string` | `null` | yes |
|<a name="subnet_ids"></a> [subnet_ids](#) | List of available subnets | `list` | `null` | yes |
|<a name="cluster_log_types"></a> [cluster_log_types](#) | Enable logging specify type for control panel | `list` | `["api", "audit", "authenticator", "controllerManager", "scheduler"]` | no |
|<a name="enable_kube_proxy_addon"></a> [enable_kube_proxy_addon](#) | Enable addon for control panel | `bool` | `true` | no |
|<a name="addon_conf"></a> [addon_conf](#) | Optional configure addons | `map(any)` | `{ most_recent = true }` | no |