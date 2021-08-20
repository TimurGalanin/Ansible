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
                                       submoduleCfg: [],  userRemoteConfigs: [[credentialsId: 'sshkey', url: 'ssh://git@github.com/TimurGalanin/Ansible.git']]])

                         sh 'pwd && ls -li ci'
                         DEPLOY_TYPE = 'BUILDONOPENSHIFT4'

                         ansiblePlaybook extras: "-vv -u root --extra-vars \"inventory_dir=\"${WORKSPACE}/ci/inventories/dev/\"\" ",
                         installation: 'ansible29',
                         inventory: "ci/inventories/dev/inventory",
                         playbook: "ci/playbooks/task2/1.gather_facts.yml"
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
