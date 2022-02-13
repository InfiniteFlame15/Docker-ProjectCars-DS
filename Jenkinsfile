pipeline {
  agent {dockerfile true}
  stages {
    stage ('Test') {
      steps {
        sh '''
          /home/steam/steamcmd/steamcmd.sh +info
          /home/steam/steamcmd/steamcmd.sh +apps_installed +app_status 332670 +app_info_print
        '''
      }
    }
  }
}
