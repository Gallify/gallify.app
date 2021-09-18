//
//  Command+ABTest.swift
//  
//
//  Created by Vladislav Fitc on 28/05/2020.
//

import Foundation

extension Command {

  enum ABTest {

    struct Add: AlgoliaCommand {

      let method: HTTPMethod = .post
      let callType: CallType = .write
      let path: Path = .ABTestsV2
      let body: Data?
      let requestOptions: RequestOptions?

      init(abTest: AlgoliaSearchClient.ABTest, requestOptions: RequestOptions?) {
        self.requestOptions = requestOptions
        self.body = abTest.httpBody
      }

    }

    struct Get: AlgoliaCommand {

      let method: HTTPMethod = .get
      let callType: CallType = .read
      let path: ABTestRoute
      let requestOptions: RequestOptions?

      init(abTestID: ABTestID, requestOptions: RequestOptions?) {
        self.requestOptions = requestOptions
        self.path = (.ABTestsV2 >>> .ABTestID(abTestID))
      }

    }

    struct Stop: AlgoliaCommand {

      let method: HTTPMethod = .post
      let callType: CallType = .write
      let path: ABTestCompletion
      let requestOptions: RequestOptions?

      init(abTestID: ABTestID, requestOptions: RequestOptions?) {
        self.requestOptions = requestOptions
        self.path = (.ABTestsV2 >>> .ABTestID(abTestID) >>> .stop)
      }

    }

    struct Delete: AlgoliaCommand {

      let method: HTTPMethod = .delete
      let callType: CallType = .write
      let path: ABTestRoute
      let requestOptions: RequestOptions?

      init(abTestID: ABTestID, requestOptions: RequestOptions?) {
        self.requestOptions = requestOptions
        self.path = (.ABTestsV2 >>> .ABTestID(abTestID))
      }

    }

    struct List: AlgoliaCommand {

      let method: HTTPMethod = .get
      let callType: CallType = .read
      let path: Path = .ABTestsV2
      let requestOptions: RequestOptions?

      init(offset: Int?, limit: Int?, requestOptions: RequestOptions?) {
        self.requestOptions = requestOptions.updateOrCreate(
          [
            .offset: offset.flatMap(String.init),
            .limit: limit.flatMap(String.init)
          ])
      }

    }

  }

}
