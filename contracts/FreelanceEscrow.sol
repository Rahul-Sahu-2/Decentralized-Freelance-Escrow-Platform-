// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IFreelanceEscrow {
    // Enums
    enum ProjectStatus { Created, InProgress, Completed, Disputed, Cancelled }
    enum MilestoneStatus { Pending, Submitted, Approved, Disputed, Rejected }
    
    // Events
    event ProjectCreated(uint256 indexed projectId, address indexed client, address indexed freelancer, uint256 totalAmount);
    event MilestoneSubmitted(uint256 indexed projectId, uint256 milestoneId, string deliverableHash);
    event MilestoneApproved(uint256 indexed projectId, uint256 milestoneId, uint256 amount);
    event DisputeRaised(uint256 indexed disputeId, uint256 indexed projectId, uint256 milestoneId, address raisedBy);
    
    // Functions
    function createProject(
        address _freelancer,
        string memory _title,
        string memory _description,
        string[] memory _milestoneDescriptions,
        uint256[] memory _milestoneAmounts,
        uint256[] memory _milestoneDeadlines
    ) external payable returns (uint256);
    
    function submitMilestone(uint256 _projectId, uint256 _milestoneId, string memory _deliverableHash) external;
    function approveMilestone(uint256 _projectId, uint256 _milestoneId) external;
    function raiseDispute(uint256 _projectId, uint256 _milestoneId, string memory _reason) external returns (uint256);
}    
