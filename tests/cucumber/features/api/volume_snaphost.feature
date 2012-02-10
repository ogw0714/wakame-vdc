@api_from_v11.12 @api_until_v11.12
Feature: Snapshot Volume API
  
  Scenario: Create and delete new snapshot volume

    When we make a successful api create call to volumes with the following options
      | volume_size |
      | 10          |
    Then the created volumes should reach state available in 60 seconds or less

    When we successfully create a snapshot from the created volume
    Then the created volume_snapshots should reach state available in 60 seconds or less

    When we successfully delete the created volumes
    Then the created volumes should reach state deleted in 60 seconds or less
      
    When we successfully delete the created volume_snapshots
    Then the created volume_snapshots should reach state deleted in 60 seconds or less

  Scenario: Show destination to upload volume snapshot
    When we make an api get call to volume_snapshots/upload_destination with no options
    Then the previous api call should be successful
    And the previous api call should have [{"results":[0]{...,{"destination_id":},...}}] equal to "local"
    And the previous api call should have [{"results":[1]{...,{"destination_id":},...}}] equal to "s3"
    And the previous api call should have [{"results":[2]{...,{"destination_id":},...}}] equal to "iijgio"
