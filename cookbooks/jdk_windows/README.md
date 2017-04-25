# jdk_windows Cookbook

TODO: Enter the cookbook description here.

e.g.
This cookbook makes your favorite breakfast sandwich.

## Requirements

TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

<B>CHEF-SOLO to be installed in the system and configure cookbooks path for solo.
<B>create solo.rb, with below content. I have my cookbooks under C:\Chef here.


tmp = 'c:/Chef/'

file_cache_path tmp

data_bag_path   File.join(tmp, 'data_bags')

cookbook_path   File.join(tmp, 'cookbooks')

role_path       File.join(tmp, 'roles')


<B> A role file(jdk_windows.json) to be created with below content.


{
	"run_list":[
  
  "recipe[jdk_windows::default]"
  
]
}
<\B>

<B>Command to run:
C:\opscode\chefdk\bin\chef-solo -c C:\Chef\solo\solo.rb -j C:\Chef\cookbooks\jdk_windows\jdk_windows.json



e.g.
### Platforms

Windows

### Chef

- Chef 12.0 or later

### Cookbooks

- `toaster` - jdk_windows needs toaster to brown your bagel.

## Attributes

TODO: List your cookbook attributes here.

e.g.
### jdk_windows::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['jdk_windows']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### jdk_windows::default

TODO: Write usage instructions for each cookbook.

e.g.
Just include `jdk_windows` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[jdk_windows]"
  ]
}
```

## Contributing

TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors: Saikrishnama,PranithaR,R Dama(ycx35)

