class ActivityQueries {
  String getAll = """ 
    {
      activities {
        id
        title
        desc
        zone
        image {
          url
        }
        startTime
        endTime
        location {
          latitude
          longitude
        }
        profile {
          name
          desc
          social
          type
        }
      }
    }
  """;
  String getOneByID(String id) {
    return """
    {
      activity(where: {id: "$id"}) {
        id
        title
        desc
        zone
        image {
          url
        }
        startTime
        endTime
        location {
          latitude
          longitude
        }
        locationRoom
        profile {
          name
          desc
          social
          type
        }
      }
    }
  """;
  }

  String getAllByTitleAndDesc(String term) {
    return """
    {
      activities(where: {OR: [{title_contains: "$term"}, {desc_contains: "$term"}]}) {
        title
        desc
        zone
        performanceType
        image {
          url
        }
        startTime
        endTime
        location {
          latitude
          longitude
        }
        profile {
          name
          desc
          social
          type
        }
      }
  	}
    """;
  }
}
