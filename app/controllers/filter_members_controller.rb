# Copyright 2013 ajf http://github.com/ajf8
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
#
class FilterMembersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    render json: FilterMember.all.to_json
  end
  
  def show
    render json: FilterMember.find(params[:id]).to_json
  end
  
  def create
    render json: FilterMember.create(params.slice(:term, :term_key, :term_operator, :filtertype, :filter_id))
  end
  
  def destroy
    render json: FilterMember.find(params[:id]).destroy()
  end
end
