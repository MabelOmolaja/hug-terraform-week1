#!/bin/bash

# Update packages
yum update -y

# Install nginx
yum install nginx -y

# Start and enable nginx
systemctl start nginx
systemctl enable nginx

# Create beautiful webpage
cat <<'EOF' > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>HUG Terraform Challenge</title>

<style>

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #0f172a, #2563eb);
    color: white;
    text-align: center;
}

.container {
    max-width: 800px;
    margin: 100px auto;
    background: rgba(255,255,255,0.1);
    padding: 40px;
    border-radius: 20px;
}

h1 {
    font-size: 45px;
    margin-bottom: 10px;
}

h2 {
    font-size: 28px;
    color: #93c5fd;
}

.card {
    background: white;
    color: #1e293b;
    padding: 25px;
    border-radius: 15px;
    margin-top: 30px;
}

.badge {
    display: inline-block;
    background: #2563eb;
    color: white;
    padding: 10px 20px;
    border-radius: 20px;
    margin: 5px;
}

footer {
    margin-top: 30px;
    font-size: 14px;
}

</style>

</head>

<body>

<div class="container">

<h1>Mabel Omolaja | Cloud Engineer </h1>

<h2>HUG Lagos/Ibadan Terraform Challenge</h2>

<div class="card">

<h3>Cloud Infrastructure Project</h3>

<p>
This website was deployed using Infrastructure as Code.
</p>

<span class="badge">AWS EC2</span>
<span class="badge">Terraform</span>
<span class="badge">Nginx</span>

</div>


<footer>
Built with Terraform | AWS | Linux
</footer>

</div>

</body>

</html>
EOF