Terra-Quest
==================
Description: This repository contains the Terraform infra and deployment automation code. This Runbook explain how to build the docker image and run the automation code.

Building Docker Image:
-----
 1. Clone the sourcecode repository:
    
        git clone https://github.com/userasr/quest.git
 3. Switch to the repository folder:
   
        cd quest
 6. Switch to the relevant branch(Skip for master branch)
 
        git checkout <BranchName>
 9. Build the docker image with following command. Example: `docker build -t dockerasr/rearc-quest:v1 .`

        docker build -t <DockerRepo>/<ProjectName>:<Tag> .
    
 11. Push the image to the docker repository. Example: `docker push dockerasr/rearc-quest:v1`

         docker push <DockerRepo>/<ProjectName>:<Tag>

Running the Terraform code for deployment automation:
-----
 1. Clone the sourcecode repository:

        git clone https://github.com/userasr/terra-quest.git
 3. Switch to the repository folder:

        cd terra-quest
 5. Switch to the relevant branch(Skip for main branch)

        git checkout <BranchName>
 7. Update the relevant details inside the `environment/quest-poc/locals.tf` as described in the comments.
 8. Initialize the terraform state:

        terrafrom init
 10. Validate the plan of execution:

         terraform plan
 12. Apply the changes(This command will provision all the infra and deploy the service on ASG)

         terraform apply

Verifying the service availability:
-----
 Open the loadbalancer DNS(`https://<loadbalancer.ap-south-1>.elb.amazonaws.com` on the browser. It should load the rearc-quest homepage.
 <img width="1728" alt="quest-homepage" src="https://github.com/user-attachments/assets/a9b3104a-38cd-4c94-ab95-5a247349b9e2" />

 Hit other APIs on the browser or CLI to verify the response:
 * [https://<loadbalancer.ap-south-1>.elb.amazonaws.com/aws](https://<loadbalancer.ap-south-1>.elb.amazonaws.com/aws)
 * [https://<loadbalancer.ap-south-1>.elb.amazonaws.com/docker](https://<loadbalancer.ap-south-1>.elb.amazonaws.com/docker)
 * [https://<loadbalancer.ap-south-1>.elb.amazonaws.com/secret_word](https://<loadbalancer.ap-south-1>.elb.amazonaws.com/secret_word)
 * [https://<loadbalancer.ap-south-1>.elb.amazonaws.com/loadbalanced](https://<loadbalancer.ap-south-1>.elb.amazonaws.com/loadbalanced)
 * [https://<loadbalancer.ap-south-1>.elb.amazonaws.com/tls](https://<loadbalancer.ap-south-1>.elb.amazonaws.com/tls)

You can also verify these API calls with CLI commands as show in following screen grab.
<img width="1075" alt="Screenshot 2025-05-08 at 1 06 05 AM" src="https://github.com/user-attachments/assets/31f871ad-9f27-46f9-89cb-46f8347f36bf" />

 Destroy the infrastrcture created by Terraform code:
 -----
      
    terraform destroy
