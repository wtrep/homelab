#!/usr/bin/python

def extract_secrets_from_services(services):
    assert isinstance(services, dict)

    merged_secrets = []
    for service in services.values():
        secrets = service.get("secrets", [])
        assert isinstance(secrets, list)
        merged_secrets += secrets

    return merged_secrets


class FilterModule(object):
    filter_map = {
        'extract_secrets_from_services': extract_secrets_from_services,
    }

    def filters(self):
        return self.filter_map
