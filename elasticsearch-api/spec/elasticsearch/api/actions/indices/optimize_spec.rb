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

require 'spec_helper'

describe 'client.indices#optimize' do

  let(:expected_args) do
    [
        'POST',
        url,
        params,
        nil,
        nil
    ]
  end

  let(:params) do
    {}
  end

  let(:url) do
    '_optimize'
  end

  it 'performs the request' do
    expect(client_double.indices.optimize).to eq({})
  end

  context 'when multiple indices are specified' do

    let(:url) do
      'foo,bar/_optimize'
    end

    it 'performs the request' do
      expect(client_double.indices.optimize(index: ['foo', 'bar'])).to eq({})
    end
  end

  context 'when parameters are specified' do

    let(:params) do
      { max_num_segments: 1 }
    end

    let(:url) do
      'foo/_optimize'
    end

    it 'performs the request' do
      expect(client_double.indices.optimize(index: 'foo', max_num_segments: 1)).to eq({})
    end
  end

  context 'when the path must be URL-escaped' do

    let(:url) do
      'foo%5Ebar/_optimize'
    end

    it 'performs the request' do
      expect(client_double.indices.optimize(index: 'foo^bar')).to eq({})
    end
  end
end
