# PowerDNS docker container #

To configure the container, mount the following location with your completed pdns.conf file

/etc/powerdns/pdns.d/pdns.conf

For example with Kubernetes using a configMap

<pre><code>volumes:
  - name: prec-conf
  configMap:
  name: prec-conf
    items:
    - key: prec
      path: recursor.conf</code></pre>

<pre><code>volumeMounts:
  - name: prec-conf
    mountPath: /etc/powerdns/recursor.d/recursor.conf
    subPath: recursor.conf</code></pre>

To import the configMap in kubernetes for the above example it would be 

<pre><code>kubectl create configmap prec-conf --from-file=prec=recursor.conf</code></pre>

Where pdns is the configmap name, pdns is the key, and pdns.conf is the file you are reading from, if you need to add a namespace, append -n 'namespace' to the end of the line

The container has no backend for pdns recursor

Please refer to the latest documentation on the powerdns website at https://www.powerdns.com/documentation.html to configure your pdns.conf file correctly