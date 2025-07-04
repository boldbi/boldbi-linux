<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD029 -->
# Bold BI Enterprise Edition

This section explains how to deploy the Bold BI application for both fresh installations and upgrade from GitHub to the host machine using autodeploy shell script.

## Deployment prerequisites

 1. Install Git based on your environment. </br>

<table>
  <thead>
    <tr>
      <th>Operating System</th>
      <th>Command</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Ubuntu</td>
      <td>
        <code>sudo apt-get update</code><br>
        <code>sudo apt-get install git -y</code>
      </td>
    </tr>
    <tr>
      <td>CentOS</td>
      <td>
        <code>sudo yum install epel-release</code><br>
        <code>sudo yum install git -y</code>
      </td>
    </tr>
  </tbody>
</table>

2. Enter the following details in the autodeploy-boldbi.sh shell script file.</br>
   **CHECKOUT_DIR:** Create and enter the directory path into this variable where you want to checkout a branch from GitHub. </br>
   **REPO_NAME:** The default repository name is `boldbi-linux`. If you wish to customize the repository name, please specify it here. </br>
   **user:** Specify the user or group that manages the service. Please ensure that this user exists in your Linux server.</br>
   **host_url:** Domain or IP address of the machine with http protocol.</br>
   > **Note:** The `host_url` is only applicable for fresh deployments. This is optional for upgrade case.</br>

   **Example for above variable:** </br>
   CHECKOUT_DIR="/home/syncfusion/boldbi" </br>
   REPO_NAME="boldbi-linux" </br>
   user="root" </br>
   host_url="<http://example.com>"
3. Provide executable permission to shell script

    ```cmd
    sudo chmod +x autodeploy-boldbi.sh
    ```

4. Navigate to the shell script path and run the following command.

    ```cmd
    sudo bash autodeploy-boldbi.sh
    ```

   > **Note:** If the Bold BI application is already present on that host machine, it will automatically upgrade with the latest changes. Otherwise, it will perform a fresh installation.

### Next steps for Fresh Installation

1. If you want configure SSL. Follow [this](https://help.boldbi.com/embedded-bi/setup/deploying-in-linux/installation-and-deployment/bold-bi-on-ubuntu/#configure-ssl?utm_source=github&utm_medium=backlinks) document.
2. [Install Optional Libraries](https://help.boldbi.com/embedded-bi/setup/deploying-in-linux/install-optional-libraries/?utm_source=github&utm_medium=backlinks)
3. [Application Startup](https://help.boldbi.com/embedded-bi/application-startup/?utm_source=github&utm_medium=backlinks)
