pipeline {
    agent any
       parameters {
               string(
          			name: 'CODE_REPO',
          			defaultValue: 'git@github.com/TimurGalanin/Ansible.git',
          			description: 'CODE_REPO'
		            )
		 string(
			name: 'BRANCH',
			defaultValue: 'main',
			description: 'BRANCH'
		)


    }



    stages {
        stage('Stage 1') {
            steps {
script {


                         //checkout([$class: 'GitSCM', branches: [[name: "master"]], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'ci/']], gitTool: 'Default', submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'shilo-av-ssh', url: "ssh://git@github.com:TimurGalanin/Ansible.git"]]])
                         checkout([$class: 'GitSCM', branches: [[name: 'main']],
                                       doGenerateSubmoduleConfigurations: false,
                                       extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'ci/']],
                                       gitTool: 'Default',
                                       submoduleCfg: [],  userRemoteConfigs: [[credentialsId: 'alex', url: 'ssh://git@github.com/TimurGalanin/Ansible.git']]])


                         DEPLOY_TYPE = 'BUILDONOPENSHIFT4'

                         ansiblePlaybook extras: "-vv --extra-vars \"inventory_dir=\"${WORKSPACE}/ci/Ansible/inventories/dev/\"\" ",
                         installation: 'ansible29',
                         inventory: "ci/Ansible/inventories/dev/inventory",
                         playbook: "ci/Ansible/playbooks/task1/dev.yml"
                       }
            }
        }
    }
    post {
        success {

            sh "echo hello"
          //  archiveArtifacts allowEmptyArchive: true, artifacts: 'code/front2/dist/*.zip', fingerprint: true

        }
      }
}
