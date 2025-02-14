#### Information Security

### Read the following overview about CorpoCorpora ACME Network infrastructure to familiarize yourself with the assessment scope, then answer the following questions:
### 1. Identify possible threat agents.
### 2. Identify possible attacks.
### 3. Identify exploitable vulnerabilities.
### 4. Possible remediation for the vulnerabilities identified in step 3.

```shell

 1)   Possible threat agents could be Cybercriminals, Insiders, Internal User Errors(because everyone has full access to the database and there is no content filter).
 
 2)  Possible attacks are: Computer Virus, Malware, Phishing, Ransomware,  Man in the middle attacks, Privilege escalation, and  Insider threats.
 
 3)  A) Everyone has full access to database access(Insider theft).
     B) No content filter: This can be a potential threat. One example could be Social engineering attacks (Phishing emails, Spear phishing, Whaling, Spam).
     C) Weak VPN Protocol
     D) Windows Active Directory vulnerabilities(local Administrator accounts)
     E) Default Router Settings
     
       
 4) A) We Should grant system privileges to users to access the database based on roles(with minimum elevation).
    B) Bringing in a reliable content filtering software in the Intranet.
    C) We should use Secure protocols like Secure Socket Tunneling Protocol.
    D) Local Administrator Acoounts should disbled after use.
    E) Chnage the Default Router settings(username and password) and disable WPS.
 
 
```
#### Cloud Security

### Q-1 What does the Shared Responsibility model mean in Cloud Security?
### How does it change as per the cloud service provider and various service
### offerings (IaaS, PaaS, SaaS)? (Try to take practical examples such as AWS EC2, Azure
### virtual machine and explain the shift as we move to AWS  Lambda or Azure Paas services).


  ```sh
   Cloud Security can be divided into two parts:
   
   
   1) Security of Cloud (Cloud Providers Responsibility) 
   The Responsibility of Cloud Providers includes the physical security of data centers, 
   and the infrastructure inside (CPU, Storage, Network). 
   
   2) Security in Cloud (Our Responsibility)
   Our Responsibility will be determined by the Cloud Services we select(IaaS, PaaS.SaaS)
   
   (i) IaaS -Taking an example of an EC2 Instance, We are responsible for:
   
   a) OS Security(Timely updating the Patches and hardening of the machine.)
   b) Security of any Application on the VM.
   c) network security (Security Group, VPC, Authentication).
   d) Security of the data(volume) used by EC2.

   (ii) PaaS  - AWS Lambda : We are responsible for:
   a) Application Security - AWS Identity and Access Management,
                             Security of traditional application-level attacks like SQL injection etc.
                             Security of any dependencies used in the lambda function
   
   b) Data Security -  Ensure Clean /tmp folder.
                       Ensuring unencrypted environment variables are stored in Secret manager.
                       Logging should be secure, and it should not log out sensitive data.


```

### Q-2 Now as you have identified how security shifts with different service offerings.
### Therefore, in this activity, you would consider a virtual machine service,
### any 1 (EC2, Azure virtual machines, or GCP compute engine) and answer the following:
### • How can you ensure network security for the chosen virtual machine service?
### • How can you ensure identity and access management for the same?
### • Finally, how can you ensure logging and monitoring are enabled for the same?

```sh
    A)  To make sure the network is secure for an EC2, these are the   
        A) we should not use Default VPC.
        B) We need to configure Security group with Proper inbound and outbound Rules. 
        C) Services like WAF and NAT should be used to make the machine secure.
        D) Internet gateway should be configured appropriately.       
        E) NACl should be configured to filter the requests for each subnet.
        
    B) For better identity and access management, Instead of using the security 
       credentials, we can create users and add them to the group based and
       assign that group Role based on the elevation needed.
       IAM also allows us to create roles with AWS managed policies and custom policies
       and we can assign those roles ec2 to let it talk to other AWS services.
       
    C) To ensure logging and monitoring, 
       1) we need to install the cloudwatch logging agent on the ec2 machine.
       2) After the installation is complete, we need to start the logging agent on the machine(using the systemctl command).
       3) We need a make sure an IAM role is attached to access CloudWatch from EC2 
       5 (If we had already had an IAM role with CloudWatchFullAcces) else we need to create a custom policy with
         CloudWatchFullAcces and attached with a role and assign it to the EC2 machine.
            
       
       
```

### Q-3 Now that you have explored the IaaS service, what cloud configuration acts as an activator for the SSRF attack.
### List down the activator (misconfiguration) in all of the following:
###    1. AWS EC2.
###    2. Azure virtual machines.
###    3. Google Compute Engine.

```shell

   The Activator misconfiguration in the following:
       1. AWS EC2                   - Using  IMDSv1 
       2. Azure virtual machines.   - allowing all the processes on the VM to access the IMDS endpoint.
       3. Google Compute engine.    - using legacy Compute Engine instance metadata APIs  
```

### Q-4 In software development lifecycle, some solutions require the use of secrets such as connecting
### to the cloud database or protecting the data stored storage services. Therefore,
### List down different types of secrets and the purpose they serve. Finally, what cloud services are used for
### the secure storage of secrets?. (You can take any cloud provider into consideration).

```shell
   Secrets are any sequence of bytes mostly under 10 KB like connection strings, account keys, or the passwords for private key files.
   Keys: involve cryptographic keys used to encrypt data or decrypt the data.
   Certificates: Certificates are simply a managed X.509 certificate. 
   
   
   Services on AWS that can be used to manage secrets are AWS Secret manager and AWS KMS. They both work
   in conjunction with each other. The AWS Secret manager uses keys managed by AWS KMS to Encrypt or Decrypt 
   the data.
```