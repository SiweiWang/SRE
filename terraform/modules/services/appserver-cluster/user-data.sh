#!/bin/bash
cat > index.html <<EOF
<h1>Hello, world</h1>
EOF

nohup busybox httpd -f -p "${var.web_service_port}" &