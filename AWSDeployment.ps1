$access_key = Read-Host('Enter access Key')
$secret_key = Read-Host('Enter Secret Key')

Set-AWSCredential -AccessKey $access_key -SecretKey $secret_key -StoreAs MSRProfile
Initialize-AWSDefaultConfiguration -ProfileName MSRProfile

$keypair = New-EC2KeyPair -KeyName KeyPair 
$keypair.KeyMaterial | Out-File -Encoding ascii C:\

$SG_check = (Get-EC2SecurityGroup).GroupName


        if($SG_check -notcontains "EC2MSRSecurityGroup"){
            New-EC2SecurityGroup -GroupName EC2MSRSecurityGroup -GroupDescription "Security group for MSR demo" 
            Grant-EC2SecurityGroupIngress -GroupName EC2MSRSecurityGroup -IpPermissions @{IpProtocol = "tcp"; FromPort = 80; ToPort = 80; IpRanges = @("0.0.0.0/0")} 
            Grant-EC2SecurityGroupIngress -GroupName EC2MSRSecurityGroup -IpPermissions @{IpProtocol = "tcp"; FromPort = 22; ToPort = 22; IpRanges = @("0.0.0.0/0")} 
            }




$instance_details = New-EC2Instance -ImageId ami-04ea996e7a3e7ad6b -MinCount 1 -MaxCount 1 -KeyName KeyPair -SecurityGroups EC2MSRSecurityGroup -InstanceType t2.micro
$Tag = New-Object Amazon.EC2.Model.Tag
$Tag.Key = "Name"
$Tag.Value = "MSR-test-Instance-1"
$InstanceId = $ec2instance.Instances | Select-Object -ExpandProperty InstanceId
New-EC2Tag -Resource $instance_details.Instances.instanceid -Tag $Tag 


$instance_details2 = New-EC2Instance -ImageId ami-04ea996e7a3e7ad6b -MinCount 1 -MaxCount 1 -KeyName KeyPair -SecurityGroups EC2MSRSecurityGroup -InstanceType t2.micro
$Tag = New-Object Amazon.EC2.Model.Tag
$Tag.Key = "Name"
$Tag.Value = "MSR-test-Instance-2"
$InstanceId = $ec2instance.Instances | Select-Object -ExpandProperty InstanceId
New-EC2Tag -Resource $instance_details.Instances.instanceid -Tag $Tag 