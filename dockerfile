FROM mono:6.12
RUN apt-get update && \
    apt-get install unzip wget -y && \
    apt-get clean
RUN wget https://github.com/dotnet/docfx/releases/download/v2.57.2/docfx.zip && \
    mkdir /usr/local/docfx && \
    unzip docfx.zip -d /usr/local/docfx && \
    rm docfx.zip && \
    echo '#!/bin/bash\nmono /usr/local/docfx/docfx.exe $@' > /usr/bin/docfx && \
    chmod +x /usr/bin/docfx