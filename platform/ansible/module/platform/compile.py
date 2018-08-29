#!/usr/bin/python

ANSIBLE_METADATA = {
    'metadata_version': '1.0',
    'status': ['preview'],
    'supported_by': 'community'
}

from ansible.module_utils.basic import AnsibleModule
import os, glob

def main():
    module = AnsibleModule(
        argument_spec=dict(
            app=dict(type='dict', required=True),
            directory=dict(type='str', required=True),
            task=dict(type='str', required=True),
            order=dict(type='str', required=False, default='asc')
        )
    )

    result = dict(
        changed=False,
        tasks=[]
    )

    tasks = []
    files = glob.glob(module.params['directory'] + '/' + module.params['task'] + '.yml')

    for file in files:
        variable = os.path.basename(file[:-(len(module.params['task']) + 5)])

        if not module.params['app'][variable]['enabled']:
            continue

        order = 0

        if 'order' in module.params['app'][variable]:
            order = module.params['app'][variable]['order']

        tasks.append((file, order))

    tasks = sorted(tasks, key=lambda task: task[1], reverse=module.params['order'] != 'asc')
    ordered = []

    for task in tasks:
        ordered.append(task[0])

    result['tasks'] = ordered
    module.exit_json(**result)

if __name__ == '__main__':
    main()
