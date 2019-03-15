# Enable Hyper-V using PowerShell (Make sure you're running PowerShell as Administrator):

> Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# When the installation has completed, reboot.

# Installing the Chocolatey Package manager for Windows
> @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

# Then use the chocolatey package manager to install minikube:
> choco install minikube

# Next install the kubernetes command line program::
> choco install kubernetes-cli

# Next we will create a virtual switch for minikube:
	- Open the Hyper-V Manager.
	- Once in the Hyper-V Manager, on the right panel, select the Virtual Switch Manager.
	- Select New virtual network switch on the right hand side, select External for the network type, and then press the Create Virtual Switch button.
	- Name the switch Primary Virtual Switch and click the apply button.

# jx create cluster, it would install Helm (if it's not installed in your environment):
> jx create cluster minikube --username admin --default-admin-password admin123! --verbose --log-level debug --vm-driver hyperv --hyperv-virtual-switch "Primary Virtual Switch"

# start a cluster in minikube then setup jenkins x:
> minikube start --bootstrapper=kubeadm  --vm-driver hyperv --hyperv-virtual-switch "Primary Virtual Switch"

Then:

> jx installation

# Open dashboard and check created namespaces: 
> minikube dashboard

# jx console to check the url for jenkins (local address within nip.io domain) :
> jx console 

# Clean up (There's no need to re-create clusters):
> helm del --purge jenkins-x

# If you face this error [Error: jobs.batch "cleanup" already exists], try:
> kubectl -n jx create serviceaccount  cleanup

# Destroy:
> minikube delete

