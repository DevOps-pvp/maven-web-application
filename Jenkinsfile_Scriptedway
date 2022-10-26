node
{
def mavenver = tool name: "Maven V3.8.5"
properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: '']])

echo "The branch name is: ${env.BRANCH_NAME}"
echo "The build number is: ${env.BUILD_NUMBER}"
echo "The build id is: ${env.BUILD_ID}"
echo "The job name is: ${env.JOB_NAME}"

stage('CheckoutCode')
{
    git branch: 'development', credentialsId: '1f554e08-c1a6-4154-a352-be4158aa1bcf', 
    url: 'https://github.com/DevOps-pvp/maven-web-application.git'    
}//stage-Git

stage('MavenBuild')
{
    sh "${mavenver}/bin/mvn clean package"
}//MavenBuild

stage('ExecuteSonarQubeReport')
{
    sh "${mavenver}/bin/mvn sonar:sonar"
}//ExecuteSonarQubeReport

stage ('UploadArtifactsIntoNexus')
{
    sh "${mavenver}/bin/mvn deploy"
}//UploadArtifactsIntoNexus

stage ('DeployToTomcat')
{
    sshagent(['tomcatSsh']) {
   sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.36.91:/opt/tomcat/webapps/"
}
}//DeployToTomcat

}//node
