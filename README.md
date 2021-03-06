# spring-rce-poc

Quick test setup to replicate the spring-rce (CVE-2022-22965):\
Deploy a docker container with Tomcat, SpringMVC and a pre-compiled vulnerable app (available at https://github.com/fengguangbin/spring-rce-war). \
Then run the exploit (grabbed from https://github.com/tweedge/springcore-0day-en).

## Requirements

Docker & python3

## How-To

First run deploy.sh to build and deploy the docker container\
Wait untill the docker is up & running\
then run exploit.sh

## Remediation

When the following remediating code in the vulnerable app is added (as mentioned in the original source code), I can confirm that the default method of exploitation used by the original exploit.py is no longer successful.

```
@InitBinder
  public void initBinder(WebDataBinder binder) {
     String[] blackList = {"class.*","Class.*","*.class.*",".*Class.*"};
     binder.setDisallowedFields(blackList);
}
``` 

At the time of writing there is no patch for Spring Core available yet.
  
## Disclaimer
  
I am not the developer of the exploit, the exploit is available on various github repositories already way before i published this project. I merely modified its content to make it work against this dockerized test-setup. This repository is meant for security researchers and developers to get a better understanding about the vulnerability and to test remediations.

Spring published that they released new version of their Spring Framework (versions 5.3.18 and 5.2.20) that would fix this vulnerability, also refer to: 
https://spring.io/blog/2022/03/31/spring-framework-rce-early-announcement

