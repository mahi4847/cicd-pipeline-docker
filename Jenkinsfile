pipeline{
    agent any
    stages{
    	stage('Build'){
    		steps {
    		     	echo 'Running build automation'
    			sh './gradelw build --no-daemon'
    			archiveArtifacts artifacts: 'dist/trainSchedule.zip'
    		}
    	}
    	stage('Build Docker Image'){
    		when{
    			branch 'master'
    		}
    		steps{
    			script{
    				app = docker.build("<docker_login_id>/node-app")
    				app.inside{
    					sh 'echo $(curl 54.184.243.113:8081)'
    				}
    			}
    		}
    	}
    	stage('Push Docker Image'){
    		when{
    			branch 'master'
    		}
    		steps{
    			script{
    				docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login'){
    					app.push("${env.BUILD_NUMBER}")
    					app.push("latest")
    				}
    			}
    		}
    	}
    }
}
