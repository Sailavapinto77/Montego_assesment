# SRE::AWS - Technical Assignment

## Table of Contents
1. Objective
2. Specifications
3. Allowed Materials

## Objective
* Write Kubernetes manifests to demonstrate the ability to deploy objects in EKS.
* Demonstrate you know how to work with kubectl.
* Show that you know how to work with CloudWatch observability tools.
* Develop the code resources in a structured and organized way, ensuring best practice with style and DRY principals.
* Commit code to your own private Git repository and subsequently share with MonetaGo engineers when requested.

## Specifications
* Kubernetes Manifests
    * Secret
        * Write a Secret object
    * Deployment
        * Write a brief Deployment
        * Include the above Secret object
        * Include a Volume
    * Service
        * Write a brief service for each of the main types, ie. Load Balancer, ClusterIP, NodePort

* Commands for kubectl (show you know the command)
    * Login to a container shell
    * Get logs from a pod
    * Perform a rolling restart of a deployment
    * Output YAML to a file for a deployment

* Monitoring and Alerting
    * Write a CloudWatch alarm
    * Write a CloudWatch dashboard
    * Write a CloudWatch Logs Insights query definition

## Allowed Materials
* Bash
* kubectl
* Terraform
* YAML

**Time:** The assignment should be completed and submitted within 1 week of receiving access to this assignment.

Feel free to contact MonetaGo with any questions. Good luck!
## License

At CodeScreen, we strongly value the integrity and privacy of our assessments. As a result, this repository is under exclusive copyright, which means you **do not** have permission to share your solution to this test publicly (i.e., inside a public GitHub/GitLab repo, on Reddit, etc.). <br>

## Submitting your solution

Please push your changes to the `main branch` of this repository. You can push one or more commits. <br>

Once you are finished with the task, please click the `Submit Solution` link on <a href="https://app.codescreen.com/candidate/681a76aa-bc2c-49e0-87ce-aa39d72de9b1" target="_blank">this screen</a>.