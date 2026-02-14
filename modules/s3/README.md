# modules/s3

Minimal S3 bucket with secure defaults.

## Defaults

- **Versioning:** enabled
- **Encryption:** KMS (aws:kms) with bucket key
- **Public access:** fully blocked

## Usage

```hcl
module "data_bucket" {
  source      = "./modules/s3"
  bucket_name = "my-data-bucket"
}
```

## Inputs

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `bucket_name` | `string` | — | Bucket name (required) |
| `versioning_enabled` | `bool` | `true` | Enable versioning |
| `encryption_enabled` | `bool` | `true` | Enable KMS encryption |
| `tags` | `map(string)` | `{}` | Resource tags |

## Outputs

| Name | Description |
|------|-------------|
| `bucket_id` | Bucket name/id |
| `bucket_arn` | Bucket ARN |
