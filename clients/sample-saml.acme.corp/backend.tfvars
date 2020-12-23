region         = "%%REGION%%"
bucket         = "%%ID%%-state"
key            = "terraform.tfstate"
dynamodb_table = "%%ID%%-lock"
encrypt        = true
