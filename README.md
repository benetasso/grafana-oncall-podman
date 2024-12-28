# Grafana OnCall playground

To start the project:

1. Install podman (seed store)
2. `podman kube play podman.yaml`
3. Configure oncall plugin:
```
curl -X POST 'http://admin:admin@localhost:3000/api/plugins/grafana-oncall-app/settings' -H "Content-Type: application/json" -d '{"enabled":true, "jsonData":{"stackId":5, "orgId":100, "onCallApiUrl":"http://localhost:8080", "grafanaUrl":"http://localhost:3000"}}'
curl -X POST 'http://admin:admin@localhost:3000/api/plugins/grafana-oncall-app/resources/plugin/install'
```
3. Run `PGPASSWORD=grafana psql -U grafana -h 127.0.0.1 timeseries -f timeseries.sql`
4. Login in http://localhost:3000 with admin/admin
