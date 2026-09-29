# Multiple Providers in Terraform

Deploys resources to two AWS regions from one project, using provider aliases, and passes providers into a reusable module.

## What it demonstrates

- **Provider aliases**: a default `aws` provider (us-east-2) plus an aliased `aws.west` (us-west-1)
- **The `provider` meta-argument**: choosing which provider a resource or data source uses
- **Passing providers to modules** with the `providers` map
- **`configuration_aliases`**: a module declaring that it needs two AWS providers, without hardcoding any region

## Structure

```
tf-multi-provider/
+-- main.tf                        # Two providers, two single-region parameters, one module call
+-- outputs.tf
+-- backend.tf
+-- modules/replicated-parameter/  # Creates the same parameter in two regions
```

## What I learned

- Working two locations
