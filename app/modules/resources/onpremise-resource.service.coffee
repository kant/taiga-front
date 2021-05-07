###
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2021-present Kaleidos Ventures SL
###

Resource = (urlsService, http) ->
    service = {}

    service.subscribeOnPremiseNewsletter = (params) ->
        url = "https://taiga-newsletter-subscriber.kaleidos.net/subscribe/"


        return http.post(url, params)
            .then (result) ->
                return Immutable.fromJS(result.data)

    return () ->
        return {"onPremise": service}

Resource.$inject = ["$tgUrls", "$tgHttp"]

module = angular.module("taigaResources2")
module.factory("tgOnPremiseResource", Resource)