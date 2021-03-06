# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

module Elasticsearch
  module XPack
    module API
      module MachineLearning
        module Actions

          # Open a job to receive and analyze data
          #
          # @option arguments [String] :job_id The ID of the job to open (*Required*)
          # @option arguments [Boolean] :ignore_downtime Controls if gaps in data are treated as anomalous or as a maintenance window after a job re-start
          # @option arguments [Time] :timeout Controls the time to wait until a job has opened. Default to 30 minutes
          #
          # @see http://www.elastic.co/guide/en/elasticsearch/reference/current/ml-open-job.html
          #
          def open_job(arguments={})
            raise ArgumentError, "Required argument 'job_id' missing" unless arguments[:job_id]
            method = Elasticsearch::API::HTTP_POST
            path   = "_xpack/ml/anomaly_detectors/#{arguments[:job_id]}/_open"
            params = {}
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
