# PowerDNS docker containers for use with external SQL servers such as galera #

To configure the container, mount the following location with your completed pdns.conf file

/etc/powerdns/pdns.d/pdns.conf

For example with Kubernetes using a configMap

<pre><code>volumes:
  - name: pdns-conf
    configMap:
      name: pdns-conf
      items:
      - key: pdns
        path: pdns.conf</code></pre>

<pre><code>volumeMounts:
  - name: pdns-conf
    mountPath: /etc/powerdns/pdns.d/pdns.conf
    subPath: pdns.conf</code></pre>

To import the configMap in kubernetes for the above example it would be 

<pre><code>kubectl create configmap pdns-conf --from-file=pdns=pdns.conf</code></pre>

Where pdns is the configmap name, pdns is the key, and pdns.conf is the file you are reading from, if you need to add a namespace, append -n 'namespace' to the end of the line

The container is built with pdns-backend-mysql

See an example below of using mysql with galera in the pdns.conf file

<pre><code>launch+=gmysql

gmysql-host=your hosts ip or fqdn
gmysql-port=3306
gmysql-user=your user
gmysql-dbname=your database name
gmysql-password=your password
gmysql-dnssec=yes</code></pre>

Please refer to the latest documentation on the powerdns website at https://www.powerdns.com/documentation.html to configure your pdns.conf file correctly