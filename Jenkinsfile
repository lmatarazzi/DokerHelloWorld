#!groovy
node  {
	def test
	// Stage 0 is the prefetch of the source code
		stage('Prefetch') {
		try {
		// notify via slack that a build has started
                notifyBuild('STARTED Prefetcht ...')
		echo "Prefetch Build"
	        notifyBuild('DONE Prefetcht!')		
		} catch(e) {
            		currentBuild.result = "Checkout failed"
            		notifyBuild(currentBuild.result)
            		throw e
            	}
	}
	// Stage 1 is the Git checkout of the source code
	stage('Git Checkout') {
		try {
		// notify via slack that a build has started
                notifyBuild('STARTED Checkout ...')
		checkout scm	
	        notifyBuild('DONE Checkout!')		
		} catch(e) {
            currentBuild.result = "Checkout failed"
            notifyBuild(currentBuild.result)
            throw e
        }
    }

	stage('Build Project') {
		try {
		// notify via slack that a build has started
                notifyBuild('STARTED Build Project ...')
		test = docker.build('doker-hello-world -f Dockerfile')
	        notifyBuild('DONE Build Project!')		
		} catch(e) {
            currentBuild.result = "Checkout failed"
            notifyBuild(currentBuild.result)
            throw e
        }
    }
	
	stage('Build Image') {
		try {
			// notify via slack that a build has started
            notifyBuild('STARTED Build Image ...')
	        notifyBuild('DONE Build Image!')		
		} catch(e) {
            currentBuild.result = "Checkout failed"
            notifyBuild(currentBuild.result)
            throw e
        }
    }

	stage('Unit Test') {
		try {
			// notify via slack that a build has started
            notifyBuild('STARTED Unit Test ...')
	        notifyBuild('DONE Unit Test!')		
		} catch(e) {
            currentBuild.result = "Checkout failed"
            notifyBuild(currentBuild.result)
            throw e
        }
    }

	stage('Publish Image') {
		try {
			// notify via slack that a build has started
            notifyBuild('STARTED Publish Image ...')
	        notifyBuild('DONE Publish Image!')		
		} catch(e) {
            currentBuild.result = "Checkout failed"
            notifyBuild(currentBuild.result)
            throw e
                } finally {
            // Success or failure, always send notifications
            notifyBuild(currentBuild.result)
		}
	}
}

//Customize notify layout
def notifyBuild(String buildStatus = 'STARTED') {
	// build status of null means successful
  	buildStatus =  buildStatus ?: 'SUCCESSFUL'
  	// Default values
  	def colorName = 'RED'
  	def colorCode = '#FF0000'
 	def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
  	def summary = "${subject} (${env.BUILD_URL})"
  	def details = """<p>STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
    		<p>Check console output at "<a href="${env.BUILD_URL}">${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>"</p>"""
  	// Override default values based on build status
  	if (buildStatus == 'STARTED') {
        color = 'YELLOW'
        colorCode = '#FFFF00'
  	} else if (buildStatus == 'SUCCESSFUL') {
        color = 'GREEN'
        colorCode = '#00FF00'
  	} else {
        color = 'RED'
        colorCode = '#FF0000'
  	}
	
}
