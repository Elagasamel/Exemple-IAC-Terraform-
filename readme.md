# AWS CLI Installation

## Steps for latest awscli on linux and macos

```
$ curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"

$ unzip awscli-bundle.zip

$ sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
```

## Verify aws version
```
$ aws --version
```

## Access key ID and secret access key

To create access keys for an IAM user

Sign in to the AWS Management Console and open the IAM console at https://console.aws.amazon.com/iam/.

In the navigation pane, choose Users.
![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/aws-00-add-user-menu.png)

Click on Add Users
![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/aws-01-add-user.png)

Enter user Name and select "Access Key - programmatic access" and create custom password.
![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/aws-02-Step-1-add-user.png)

Click "Create Group Button"
![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/aws-03-Step-2-add-group.png)

Enter the Group Name and Select "Administration Access"
![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/aws-04-Step-2-add-group.png)

![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/aws-05-Step-2-view-group.png)

Add Tags (Optional)
![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/aws-06-Step-3-add-tags.png)

Review the User Details
![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/aws-07-Step-4-review.png)

Download the Credentials in CSV Format
![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/aws-08-Step-5-add-user-complete.png)

Choose the name of the user whose access keys you want to create, and then choose the Security credentials tab.

In the Access keys section, choose Create access key.

To view the new access key pair, choose Show. You will not have access to the secret access key again after this dialog box closes. Your credentials will look something like this:

Access key ID: AKIAIOSFODNN7EXAMPLE

Secret access key: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY

To download the key pair, choose Download .csv file. Store the keys in a secure location. You will not have access to the secret access key again after this dialog box closes.

Keep the keys confidential in order to protect your AWS account and never email them. Do not share them outside your organization, even if an inquiry appears to come from AWS or Amazon.com. No one who legitimately represents Amazon will ever ask you for your secret key.

After you download the .csv file, choose Close. When you create an access key, the key pair is active by default, and you can use the pair right away.

## Configure the AWS CLI Environment 
```
$ aws configure

AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
Default output format [None]: json
```