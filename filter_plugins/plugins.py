#!/usr/bin/python

def extract_secrets_from_services(services):
    merged_secrets = []
    for service in services.values():
        secrets = service.get("secrets", [])
        merged_secrets += secrets
    return merged_secrets


def parse_uid_and_gid(output):
    return {result["name"]: {"uid": result["uid"], "gid": result["group"]} for result in output["results"]}


def services_with_persistent_data(services):
    return [name for (name, details) in services.items() if details.get("container_persistent_directory")]


class FilterModule(object):
    filter_map = {
        'extract_secrets_from_services': extract_secrets_from_services,
        'parse_uid_and_gid': parse_uid_and_gid,
        'services_with_persistent_data': services_with_persistent_data,
    }

    def filters(self):
        return self.filter_map
