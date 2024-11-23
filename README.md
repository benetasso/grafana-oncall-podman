# Grafana OnCall playground

To start the project:

1. Install podman (seed store)
2. `podman kube play podman.yaml`
3. Run `PGPASSWORD=grafana psql -U grafana -h 127.0.0.1 timeseries -f timeseries.sql`
4. Login in http://localhost:3000 with admin/admin
5. Configure OnCall plugin