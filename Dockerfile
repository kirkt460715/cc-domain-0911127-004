FROM python:3.11-slim-bookworm@sha256:a83ba18aef0f865b1a4a611c2cf460fe446f2795673bbb9fe43be570439e3b39
WORKDIR /app
COPY . .
CMD ["sh", "-c", "python3 -m unittest discover -s tests -v && python3 -m compileall -q network catchments supply equity analysis_runs accessibility.py && python3 accessibility.py demo --fixture fixtures/community.json"]
