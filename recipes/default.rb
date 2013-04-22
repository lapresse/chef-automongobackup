#
# Cookbook Name:: automongobackup
# Recipe:: default
#
# Copyright 2013, La Presse
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

package 'mongo-10gen' do
  options '--nogpgcheck'
end

template '/usr/local/scriptslp/sbin/automongobackup.sh' do
  mode 0755
end

cron 'run_automongobackup' do
  hour 3
  minute 0
  mailto 'webops@lapresse.ca'
  command '/usr/local/scriptslp/sbin/automongobackup.sh'
end
