# frozen_string_literal: true

module VirusTotal
  module Client
    class Graph < Base
      include Action::Get
      include Action::Relationships

      #
      # Return graphs.
      #
      # @see https://developers.virustotal.com/v3.0/reference#graphs
      #
      # @param [String, nil] filter Return the graphs matching the given criteria only
      # @param [Integer, nil] limit Maximum number graphs to retrieve
      # @param [String, nil] cursor Continuation cursor
      # @param [String, nil] order Sort order
      # @param [String, nil] attributes Specific fields to retrieve
      #
      # @return [Hash]
      #
      def search(filter: nil, limit: nil, cursor: nil, order: nil, attributes: nil)
        params = {
          filter: filter,
          limit: limit,
          cursor: cursor,
          order: order,
          attributes: attributes
        }.compact
        _get("/graphs", params) { |json| json }
      end

      #
      # Create a graph with the given nodes and links.
      #
      # @see https://developers.virustotal.com/v3.0/reference#create-graphs
      #
      # @param [Hash] **params
      #
      # @return [Hash]
      #
      def create(**params)
        _post("/graphs", params) { |json| json }
      end

      #
      # Update a graph.
      #
      # @see https://developers.virustotal.com/v3.0/reference#graphs-update
      #
      # @param [String] id A 65 char length id which uniquely identify the graph.
      # @param [Hash] **params
      #
      # @return [Hash]
      #
      def update(id, **params)
        _patch("/graphs/#{id}", params) { |json| json }
      end

      #
      # Retrieve graph viewers.
      #
      # @see https://developers.virustotal.com/v3.0/reference#graphs-viewers
      #
      # @param [String] id A 65 char length id which uniquely identify the graph.
      # @param [String, nil] limit Maximum number of related objects to retrieve
      # @param [Integer, nil] cursor Continuation cursor
      #
      # @return [Hash]
      #
      def viewers(id, limit: nil, cursor: nil)
        params = {
          limit: limit,
          cursor: cursor
        }.compact
        _get("/graphs/#{id}/relationships/viewers", params) { |json| json }
      end

      #
      # Add a user or group as a graph viewer.
      #
      # @see https://developers.virustotal.com/v3.0/reference#graphs-add-viewer
      #
      # @param [String] id A 65 char length id which uniquely identify the graph.
      # @param [Hash] **params
      #
      # @return [Hash]
      #
      def add_viewer(id, **params)
        _post("/graphs/#{id}/relationships/viewers", params) { |json| json }
      end

      #
      # Check if a user or group is a graph viewer
      #
      # @see https://developers.virustotal.com/v3.0/reference#graphs-check-viewer
      #
      # @param [String] id A 65 char length id which uniquely identify the graph.
      # @param [String] user_or_group_id user or group ID
      #
      # @return [<Type>] <description>
      #
      def check_viewer(id, user_or_group_id)
        _get("/graphs/#{id}/relationships/viewers/#{user_or_group_id}") { |json| json }
      end

      #
      # Remove a user or group as viewer of a graph.
      #
      # @see https://developers.virustotal.com/v3.0/reference#graphs-delete-viewer
      #
      # @param [String] id A 65 char length id which uniquely identify the graph.
      # @param [String] user_or_group_id user or group ID
      #
      # @return [<Type>] <description>
      #
      def delete_viewer(id, user_or_group_id)
        _delete("/graphs/#{id}/relationships/viewers/#{user_or_group_id}") { |json| json }
      end

      #
      # Retrieve graph editors.
      #
      # @see https://developers.virustotal.com/v3.0/reference#graphs-editors
      #
      # @param [String] id A 65 char length id which uniquely identify the graph.
      # @param [String, nil] limit Maximum number of related objects to retrieve
      # @param [Integer, nil] cursor Continuation cursor
      #
      # @return [Hash]
      #
      def editors(id, limit: nil, cursor: nil)
        params = {
          limit: limit,
          cursor: cursor
        }.compact
        _get("/graphs/#{id}/relationships/editors", params) { |json| json }
      end

      #
      # Add a user or group as a graph editor.
      #
      # @see https://developers.virustotal.com/v3.0/reference#graphs-add-editor
      #
      # @param [String] id A 65 char length id which uniquely identify the graph.
      # @param [Hash] **params
      #
      # @return [Hash]
      #
      def add_editor(id, **params)
        _post("/graphs/#{id}/relationships/editors", params) { |json| json }
      end

      #
      # Check if a user or group is a graph editor.
      #
      # @see https://developers.virustotal.com/v3.0/reference#graphs-check-editor
      #
      # @param [String] id A 65 char length id which uniquely identify the graph.
      # @param [String] user_or_group_id user or group ID
      #
      # @return [Hash]
      #
      def check_editor(id, user_or_group_id)
        _get("/graphs/#{id}/relationships/editors/#{user_or_group_id}") { |json| json }
      end

      #
      # Remove a user or group as editor of a graph.
      #
      # @see https://developers.virustotal.com/v3.0/reference#graphs-delete-editor
      #
      # @param [String] id A 65 char length id which uniquely identify the graph.
      # @param [String] user_or_group_id user or group ID
      #
      # @return [Hash]
      #
      def delete_editor(id, user_or_group_id)
        _delete("/graphs/#{id}/relationships/editors/#{user_or_group_id}") { |json| json }
      end

      private

      def relationships
        @relationships ||= %w[
          comments
          items
          viewers
          editors
          owner
          group
        ].map(&:to_sym)
      end
    end
  end
end
