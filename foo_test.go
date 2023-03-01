package test

import (
	"crypto/tls"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformComputeEngine(t *testing.T) {
	terraformOptions := &terraform.Options{
		// The path to the Terraform code that will be tested.
		TerraformDir: "terraform",

		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"terraform.tfvars"},
	}

	//Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply".
	terraform.InitAndApply(t, terraformOptions)

	//Add unit tests here
}
