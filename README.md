# tor-jmeter

## About

tor-jmeter is a docker image to enabling jmeter making request to an onion service (tor's hidden service).

tor-jmeter is based on an excellent work (lazzurs/jmeter)[https://hub.docker.com/r/lazzurs/jmeter].

The drive for this tor-jmeter creation is for enabling cloud based continuous integration (CI) pipeline, while keeping data and services safely stays in local test developer's machine or their original machines.

tor-jmeter is can be retrieved by pulling it from dockerhub (indraginanjar/tor-jmeter)[https://hub.docker.com/r/indraginanjar/tor-jmeter]

```bash
docker pull indraginanjar/tor-jmeter:5.2
```

## Warning

### State

tor-jmeter is on early development, expect it to be not working or troublesome.

### Please Avoid Abusive Testing On Tor Network

Please be kind, Tor network is provided by volunteers, so PLEASE AVOID ABUSIVE TESTING on tor network.

Please make sure these next things:

1. Only use tor-jmeter for checking correctness of the test plan, not for real performance/load/stress testing.

2. Keep loops count very low, '1' is an ideal number.

3. Keep threads/users number very low, '1' is an ideal number.

4. Keep request number very low, '1' is an ideal number.

5. Keep transmitted data size low.

6. Set delay between request, whenever feasible.

## Usage

If you run tor-jmeter without parameter, the container will execute `/container-init.sh` script, who run jmeter http proxied through polipo and tor without GUI (parameter *-n*)

```bash
docker run --rm indraginanjar/tor-jmeter:5.2
```

### Simple Example

This is an example how to run a JMeter's test plan with tor-jmeter 

```bash
docker run --rm --name torjmeter -v $(pwd):/home/jmeter/apache-jmeter-5.2/plan indraginanjar/tor-jmeter:5.2 -n -t plan/test-plan.jmx
```

### Report Generating Example

```bash
docker run --rm --name torjmeter -v $(pwd):/home/jmeter/apache-jmeter-5.2/plan indraginanjar/tor-jmeter:5.2 /container-init.sh -l result.csv -e -o plan/report -f -t plan/test-plan.jmx
```

### Building Image from Dockerfile

```bash
./bin/docker_build.sh
```

### Exploring Container Internals

```bash
./bin/docker_run_bash.sh
```
