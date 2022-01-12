### Q-1 What does the Shared Responsibility model mean in Cloud Security? 
### How does it change as per the cloud service provider and various service
### offerings (IaaS, PaaS, SaaS)? (Try to take practical examples such as AWS EC2, Azure 
### virtual machine and try to explain the shift as we move to AWS  Lambda, or Azure Paas services).


  ```sh
   The Cloud Security can be divided into two parts:
   
   
   1) Security of Cloud (Cloud Provider's Responsibility) 
   The responsibility of Cloud Providers includes the physical security of data-centres, 
   and the infrastructure inside (CPU, Storage, Network). 
   
   2) Security in Cloud (Our Responsibility)
   Our responsibility will be determined by the Cloud Services we select(IaaS,PaaS.SaaS)
   
   (i) IaaS -Taking example of a EC2 Instance, We are responsible for:
   
   a) OS Security(Timely updating the Patches and hardening of the machine.)
   b) Security of any Application on the the VM.
   c) Security of the network(Security Group, VPC, Authentication).
   d) Security of the data(volume) used by EC2.

   (ii) PaaS  - AWS Lambda : We are responsible for:
   a) Application Security - AWS Identity and Access Management,
                             Security of traditional application-level attacks like SQL injection etc.
                             Security of any dependencies use in the lambda function
   
   b) Data Security -  Ensure Clean /tmp folder.
                       Ensuring unencrypted environment variables are stored in Secret manager.
                       Logging should be secure and it should not log out sensitive data.


```

### Q-2 Now as you have identified how security shifts with different service offerings. 
### Therefore, in this activity, you would consider a virtual machine service, 
### any 1 (EC2, Azure virtual machines, or GCP compute engine) and answer the following:
### • How can you ensure network security for the chosen virtual machine service?
### • How can you ensure identity and access management for the same?
### • Finally, how can you ensure logging and monitoring is enabled for the same?

```sh
    A)  To make sure the network is secure for a EC2 
        Ensure that we are not using Default VPC
        Configure Security group with Proper inbound and outbound Rules. 
        Services like WAF should be used to make the machine secure.
        Internet gateway should be properly configured        
        NACL should be configured to filter the requests for each subnet
        
    B)
        


```