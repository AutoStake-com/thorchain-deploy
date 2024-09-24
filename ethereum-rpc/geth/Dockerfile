FROM ethereum/client-go:v1.14.5

# Install curl for healthchecks
RUN apk --no-cache add curl

# Add jwtsecret
ADD --chown=61000:61000 jwtsecret /jwtsecret
