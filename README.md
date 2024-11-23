This test will download about 400MB of resources:
(GraalVM, paper server software, mojang server software)

A paper server will be run with chunky, which will generate
a 1000 radius world around the spawn, totalling 16129 chunks.

Upon completion files will take up around 1GB of disk space.

Instructions:
1. Run "Setup.bat"
    - Downloads / Extracts GraalVM
    - Downloads Paper Minecraft server
    - Creates RunTest.bat
    - Removes itself once setup is complete

2. Run "RunTest.bat"
    - Deletes the "world" folder
    - Runs /templates/autoconfig.vbs, setting paper-global.yml
    variables for IO / Worker threads
    - Runs /templates/createstart.vbs, creating a start.bat file
    which will allocate 90% of your free RAM to the server software
    - Begins the test

3. Wait for the test to complete
    - In the console, the result will be presented as
    "[stopAfterGeneration] Generation completed for world in: X seconds."

4. Running again:
    - In order to run the test again, simply
    execute "RunTest.bat" again. This avoids having
    to download dependencies again. 

This test is not in any way intended to benchmark
the storage of the machine it runs on - it appears
paper's IO threads will cache chunks in memory during
generation and continue to write them after
Chunky produces a GenerationCompleteEvent.

(Slow storage manifests as a pause before the
"Press any key to continue" message, as the 
server waits for IO threads to write to disk
before closing.)

For example, running on a USB stick only added around
10 seconds to the reported generation time on my machine,
but the server continued writing chunks to the drive
before closing for around another 15 seconds.

Below are some example times I've collected from
both my computers (and phone, for fun!) and those of volunteers.

|Processor       |   Time      |
|:---------------|-----------:|
|i9-12900k       |   49 seconds|
|Ryzen 7 7800X3D |   59 seconds|
|i7-14700f       |   65 seconds|
|Ryzen 7 5800X   |   72 seconds|
|Ryzen 9 3900X   |   74 seconds|
|i7-4700mq       |   392 seconds|
|Exynos 9810     |   700 seconds|